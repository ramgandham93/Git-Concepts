public class SetOperationsUtility {
        public static Set<Integer> getUnion(Set<Integer> firstSet, Set<Integer> secondSet) {
        set<integer> result = new Set<integer>();
        for(Integer val : firstset) {
             result.add(val);
        }
        for(Integer val : secondset) {
            result.add(val);
        }
        return result;
}
}