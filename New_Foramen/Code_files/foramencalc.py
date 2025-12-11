import numpy as np

def normalize(v):
    return v / np.linalg.norm(v)

#Finds line distance 
def line_distance(point, a, b):
    return np.abs(np.cross(b - a, point - a) / np.linalg.norm(b - a))

#Finds intersectino between of two lines
def intersect_lines(p1, d1, p2, d2):
    A = np.array([d1, -d2]).T
    if np.linalg.matrix_rank(A) < 2:
        return None
    t, s = np.linalg.solve(A, p2 - p1)
    return p1 + t * d1

def inscribed_circle_quad(P):
    # Convert to numpy
    P0, P1, P2, P3 = P

    # Edge vectors
    v01 = normalize(P1 - P0)
    v03 = normalize(P3 - P0)
    v12 = normalize(P2 - P1)
    v10 = normalize(P0 - P1)
    v23 = normalize(P3 - P2)
    v21 = normalize(P1 - P2)
    v30 = normalize(P0 - P3)
    v32 = normalize(P2 - P3)

    # Angle bisectors at vertices
    b0 = normalize(v01 + v03)
    b1 = normalize(v12 + v10)
    b2 = normalize(v23 + v21)
    b3 = normalize(v30 + v32)

    #Find two bisector intersections → circle center
    C1 = intersect_lines(P0, b0, P1, b1)
    C2 = intersect_lines(P2, b2, P3, b3)

    if C1 is None or C2 is None:
        raise ValueError("Bisectors did not intersect — degenerate quadrilateral.")

    # Average intersection for stability
    C = (C1 + C2) / 2.0

    # Distances to edges → radius
    r = min([
        line_distance(C, P0, P1),
        line_distance(C, P1, P2),
        line_distance(C, P2, P3),
        line_distance(C, P3, P0)
    ])

    return C, r